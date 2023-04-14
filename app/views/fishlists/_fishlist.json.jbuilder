json.extract! fishlist, :id, :date, :time, :prefecture, :place, :map, :fishname, :fishlength, :fishweight, :fishingmethod, :fishimg, :created_at, :updated_at
json.url fishlist_url(fishlist, format: :json)
