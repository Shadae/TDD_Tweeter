require 'spec_helper'

describe TweetsController do

  describe 'GET #new' do
    it "returns http success" do
      get :new
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe 'GET #show' do
    it 'does show tweet' do
      tweet = Tweet.create(author: 'Bob', content: 'The content')
      tweet.save

      get :show, id: tweet.id
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe 'GET #index' do
    it "returns http success" do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end


  describe 'POST #create' do
    it 'does create new tweet' do
     tweet = Tweet.create(author: 'Bob', content: 'The content')

      get :create, id: tweet.id, post: {
                                      author: 'The title',
                                      content: 'The content' }
    end

    it 'renders new if text is missing' do
      tweet = Tweet.create(author: 'Bob', content: 'The content')

      get :create, id: tweet.id, post: {
                                      title: '' }

      expect(response).to render_template(:new)
    end
  end

end
