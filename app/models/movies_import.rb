class MoviesImport
    include ActiveModel::Model
    require 'roo'
  
    attr_accessor :file
  
    def initialize(attributes={})
      attributes.each { |name, value| send("#{name}=", value) }
    end
  
    def persisted?
      false
    end
  
    def open_spreadsheet
      case File.extname(file.original_filename)
      when ".csv" then Csv.new(file.path, nil, :ignore)
      when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
      when ".xlsx" then Roo::Excelx.new(file.path)
      else raise "Unknown file type: #{file.original_filename}"
      end
    end
  
    def load_imported_movies
      spreadsheet = open_spreadsheet
      header = spreadsheet.row(1)
      (2..spreadsheet.last_row).map do |i|
        row = Hash[[header, spreadsheet.row(i)].transpose]
        movie = Movie.find_by_id(row["id"]) || Movie.new
        movie.attributes = row.to_hash
        movie
      end
    end
  
    def imported_movies
      @imported_movies ||= load_imported_movies
    end
  
    def save
      if imported_movies.map(&:valid?).all?
        imported_movies.each(&:save!)
        true
      else
        imported_movies.each_with_index do |movie, index|
          movie.errors.full_messages.each do |msg|
            errors.add :base, "Row #{index + 6}: #{msg}"
          end
        end
        false
      end
    end
  
  end