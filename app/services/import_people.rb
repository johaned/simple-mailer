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
  # @param [ File ] import_people_form
  #
  # @return [ Boolean ]
  #
  def call(import_people_form)
    CSV.foreach(import_people_form.file.tempfile, headers: true) do |row|
      Person.find_or_create_by name: row['Name'].to_s.downcase, email: row['Email'].downcase, gender: row['Gender'], rol: row['Role']
    end
    true
  rescue => e
    Rails.logger.error e.message
    false
  end
end
