require 'csv'

#
# Class ImportPeople provides a logic for importing people from a csv file
#
# @author Johan Tique <johan.tique@analisistem.com>
#
class ImportPeople
  #
  # Just a call method
  #
  # @param [ File, String ] file_reference, it could be either a file path or a file, it represents a way for getting the csv content
  #
  # @return [ Boolean ]
  #
  def call(file_reference)
    CSV.foreach(file_reference, headers: true) do |row|
      Person.find_or_create_by name: row['Name'].to_s.downcase, email: row['Email'].downcase, gender: row['Gender'], rol: row['Role']
    end
    true
  rescue => e
    Rails.logger.error e.message
    false
  end
end
