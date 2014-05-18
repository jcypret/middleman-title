require 'spec_helper'

page_with_title = { data: { title: 'Hello World', title_reverse: nil, title_name: nil } }.to_properties
page_without_title = { data: { title: nil, title_reverse: nil, title_name: nil } }.to_properties

describe Middleman::Title::Helpers do
	let(:h) { Class.new { extend Middleman::Title::Helpers } }

	describe '#page_title' do

		context 'website name is provided' do
			before(:each) { h.stub(:options) { { name: 'Website Name' } } }

			context 'current page has title' do
				before(:each) { h.stub(:current_page) { page_with_title } }

				it 'returns website name and title' do
					expect(h.page_title).to eq 'Hello World &mdash; Website Name'
				end
			end

			context 'current_page title is blank' do
				before(:each) { h.stub(:current_page) { page_without_title } }

				it 'returns websites name' do
					expect(h.page_title).to eq 'Website Name'
				end
			end
		end

		context 'website name is not provided' do
			before(:each) { h.stub(:options) { { name: nil } } }

			context 'current page has title' do
				before(:each) { h.stub(:current_page) { page_with_title } }

				it 'returns current page title' do
					expect(h.page_title).to eq 'Hello World'
				end
			end

			context 'current_page title is blank' do
				before(:each) { h.stub(:current_page) { page_without_title } }

				it 'returns nil' do
					expect(h.page_title).to eq ''
				end
			end
		end

	end
end