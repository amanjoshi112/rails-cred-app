require 'rails_helper'

RSpec.describe Article, type: :model do 
	subject{ Article.new(title: "Submission for 8th Sem", body: "Submission for 8th sem starts from 29th of April")}
	
	before{ subject.save }

	it 'title should be present' do 
		subject.title = nil 
		expect(subject).to_not be_valid
	end

	it 'body should be present' do 
		subject.body = nil 
		expect(subject).to_not be_valid
	end

	describe 'present validations' do 
		it { should validate_presence_of(:title).on(:create) }
		it { should validate_presence_of(:body).on(:create) }
	end
end	
