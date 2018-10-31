require 'test_helper'

describe Channel do

  it "Cannot be initialized with less than 2 parameters" do
   expect {
     Channel.new
   }.must_raise ArgumentError

   expect {
     Channel.new "Name"
   }.must_raise ArgumentError
 end

 it "Must initialize name & id properly" do
   channel = Channel.new("Name", "ID")
   expect(channel.name).wont_be_nil
   expect(channel.name).must_equal "Name"

   expect(channel.id).wont_be_nil
   expect(channel.id).must_equal "ID"
 end

 it 'must raise error for empty string name and id' do
   empty_name = ""
   empty_id = ""
   expect{
     Channel.new(empty_name, "ID")
   }.must_raise ArgumentError

   expect{
     Channel.new("Name", empty_id)
   }.must_raise ArgumentError
 end

 it 'must have default value for options' do
 end

 it 'must be able to populate options' do
 end
end
