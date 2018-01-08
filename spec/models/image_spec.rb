require 'rails_helper'

RSpec.describe Image do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without an attached file" do
        image = Image.create(image_file_name: "shuttle.jpg", image_content_type: "image/jpeg", image_file_size: 2396470)

        expect(image).to be_valid
      end
    end
  end

  describe "relationships" do
    it "behaves like" do
      image = Image.create(image_file_name: "shuttle.jpg", image_content_type: "image/jpeg", image_file_size: 2396470)
      category = Category.create(title: "Vacation")
      idea = Idea.create(title: "Summer Trip", description: "Swimming with whale sharks", category: category)
      idea_image = IdeaImage.create(idea_id: idea.id, image_id: image.id)

      expect(idea.images.first.image_file_name).to eq("shuttle.jpg")
    end

    it 'has many ideas through idea_images' do
      image = Image.create(image_file_name: "shuttle.jpg", image_content_type: "image/jpeg", image_file_size: 2396470)

      expect(image).to respond_to(:ideas)
      expect(image).to respond_to(:idea_images)
    end
  end


end
