class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def self.order_by(records, params = {})
    sort_by = JSON.parse(params['sort_by']) if params['sort_by'].present?
    if sort_by.present?
      sort_by.each do |order_hash|
        order_key = order_hash['id'].to_sym
        order_in = order_hash['desc'] ? 'desc' : 'asc'
        records = records.order("#{order_attr[order_key]} #{order_in}")
      end
    elsif records.respond_to? :ordered
      records = records.ordered
    end
    records
  end
end
