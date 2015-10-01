require 'bundler/setup'
Bundler.require(:test)
require_relative '../lib/sau'

TEST_REGION = 'reg'
TEST_REGION_ID = 42
TEST_REGION_TITLE = 'Test Region'
TEST_DATA_PARAMS = { measure: 'mes', dimension: 'dim', limit: 10, sciname: true }
TEST_REGION_DETAIL = { id: TEST_REGION_ID, title: TEST_REGION_TITLE, foo: 'bar' }
