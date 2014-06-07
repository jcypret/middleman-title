require 'spec_helper'

describe Middleman::Title::Helpers do
  let(:h) { Class.new { extend Middleman::Title::Helpers } }

  describe '#page_title' do
    before(:each) do
      h.stub_chain(:title_options, :site).and_return(false)
      h.stub_chain(:title_options, :separator).and_return(' &mdash; ')
      h.stub_chain(:title_options, :reverse).and_return(false)

      h.stub_chain(:current_page, :data, :title).and_return(nil)
      h.stub_chain(:current_page, :data, :title_site).and_return(nil)
      h.stub_chain(:current_page, :data, :title_reverse).and_return(nil)
    end

    context 'website name is set' do
      before(:each) { h.stub_chain(:title_options, :site).and_return('Website Name') }

      context 'page name is set' do
        before(:each) { h.stub_chain(:current_page, :data, :title).and_return('How to Say Hello to the World') }

        it 'puts website name last by default' do
          expect(h.page_title).to eq 'How to Say Hello to the World &mdash; Website Name'
        end

        it 'puts website name first when frontmatter title_reverse is true' do
          h.stub_chain(:current_page, :data, :title_reverse).and_return(true)
          expect(h.page_title).to eq 'Website Name &mdash; How to Say Hello to the World'
        end

        it 'puts website name last when frontmatter title_reverse is false' do
          h.stub_chain(:current_page, :data, :title_reverse).and_return(false)
          expect(h.page_title).to eq 'How to Say Hello to the World &mdash; Website Name'
        end

        it 'puts website name first when activate reverse is true' do
          h.stub_chain(:title_options, :reverse).and_return(true)
          expect(h.page_title).to eq 'Website Name &mdash; How to Say Hello to the World'
        end

        it 'puts website name last when activate reverse is true but frontmatter is false' do
          h.stub_chain(:title_options, :reverse).and_return(true)
          h.stub_chain(:current_page, :data, :title_reverse).and_return(false)
          expect(h.page_title).to eq 'How to Say Hello to the World &mdash; Website Name'
        end

        context 'separator is set' do
          it 'to a vertical bar' do
            h.stub_chain(:title_options, :site).and_return('Website Name')
            h.stub_chain(:title_options, :separator).and_return(' | ')
            expect(h.page_title).to eq 'How to Say Hello to the World | Website Name'
          end
        end

        context 'but website name set to false in frontmatter' do
          it 'returns only page name' do
            h.stub_chain(:current_page, :data, :title_site).and_return(false)
            expect(h.page_title).to eq 'How to Say Hello to the World'
          end
        end

        context 'page name is an array' do
          it 'joins page name with separator' do
            h.stub_chain(:current_page, :data, :title).and_return(['John Doe', 'Staff'])
            expect(h.page_title).to eq 'John Doe &mdash; Staff &mdash; Website Name'
          end
        end
      end

      context 'page name is not set' do
        it 'returns only the website name' do
          expect(h.page_title).to eq 'Website Name'
        end
      end
    end

    context 'website name is not set' do

      context 'page name is set' do
        before(:each) { h.stub_chain(:current_page, :data, :title).and_return('How to Say Hello to the World') }

        it 'returns only the page name' do
          expect(h.page_title).to eq 'How to Say Hello to the World'
        end
      end

      context 'page name is not set' do
        it 'returns an empty string' do
          expect(h.page_title).to eq ''
        end
      end

    end

  end
end
