require 'rails_helper'

RSpec.describe Idea do
  describe 'validations' do
    context 'invalid attributes' do
      it 'is invalid without a title' do
        category = Category.create(title: "Vacation")
        idea = Idea.create(description: "Swimming with whale sharks", category_id: category.id)

        expect(idea).to be_invalid
      end

      it 'is invalid without a description' do
        category = Category.create(title: "Vacation")
        idea = Idea.create(title: "Summer Trip", category: category)
        expect(idea).to be_invalid
      end

      it "is invalid without a category" do
        idea = Idea.create(title: "Summer Trip", description: "Swimming with whale sharks")
        expect(idea).to be_invalid
      end
    end

    context 'valid attributes' do
      it 'is valid with a title, description, and category' do
        category = Category.create(title: "Vacation")
        idea = Idea.create(title: "Summer Trip", description: "Swimming with whale sharks", category: category)
        expect(idea).to be_valid
      end
    end
  end
  describe 'relationships' do
    it 'has many images' do
      category = Category.create(title: "Vacation")
      idea = Idea.create(title: "Summer Trip", description: "Swimming with whale sharks", category: category)
      expect(idea).to respond_to(:images)
    end
  end
end