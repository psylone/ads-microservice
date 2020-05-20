# Code execution order is important during Sequel initialization process.
# See http://sequel.jeremyevans.net/rdoc/files/doc/code_order_rdoc.html

Sequel.connect(Settings.db.to_hash)

Sequel::Model.plugin :validation_helpers
