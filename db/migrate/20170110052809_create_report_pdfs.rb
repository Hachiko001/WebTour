class CreateReportPdfs < ActiveRecord::Migration[5.0]
  def change
    create_table :report_pdfs do |t|

      t.timestamps
    end
  end
end
