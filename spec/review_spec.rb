require "rails_helper"

describe Review , type: :model do

  context 'when saving a model' do
    let(:review) { FactoryGirl.build(:review) }

    it "calls the restaurant's #update_rating!" do
      allow(review.restaurant).to receive(:update_rating!).and_return(nil)
      expect(review.restaurant).to receive(:update_rating!).once
      review.save!
    end

    describe 'validations' do
      it 'validates existence of restaurant' do
        review.restaurant = nil
        expect(review).not_to be_valid
      end

      it 'validates existence of user' do
        review.user = nil
        expect(review).not_to be_valid
      end

      it 'validates existence of comment' do
        review.comment = nil
        expect(review).not_to be_valid
      end
    end
  end
end

