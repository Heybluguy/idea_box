require 'rails_helper'

RSpec.describe Idea do
  describe 'validations' do
    context 'invalid attributes' do
      it 'is invalid without a title' do
        user = User.create(username: "heyblugirl", password: "test", role: 0)
        category = Category.create(title: "Vacation")
        idea = Idea.create(description: "Swimming with whale sharks", category_id: category.id, user: user)

        expect(idea).to be_invalid
      end

      it 'is invalid without a description' do
        user = User.create(username: "heyblugirl", password: "test", role: 0)
        category = Category.create(title: "Vacation")
        idea = Idea.create(title: "Summer Trip", category: category, user: user)
        expect(idea).to be_invalid
      end

      it "is invalid without a category" do
        user = User.create(username: "heyblugirl", password: "test", role: 0)
        idea = Idea.create(title: "Summer Trip", description: "Swimming with whale sharks", user: user)
        expect(idea).to be_invalid
      end
    end

    context 'valid attributes' do
      it 'is valid with a title, description, and category' do
        user = User.create(username: "heyblugirl", password: "test", role: 0)
        category = Category.create(title: "Vacation")
        idea = Idea.create(title: "Summer Trip", description: "Swimming with whale sharks", category: category, user: user)
        expect(idea).to be_valid
      end
    end
  end
  describe 'relationships' do
    it 'has many images' do
      user = User.create(username: "heyblugirl", password: "test", role: 0)
      category = Category.create(title: "Vacation")
      idea = Idea.create(title: "Summer Trip", description: "Swimming with whale sharks", category: category, user: user)
      expect(idea).to respond_to(:images)
    end
  end
end