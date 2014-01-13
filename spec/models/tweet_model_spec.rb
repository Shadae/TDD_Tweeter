require 'spec_helper'

describe Tweet do
  it 'is valid with an author and content' do 
    tweet = Tweet.new(author: 'Bob', content: 'This is content')

    expect(tweet).to be_valid
  end
end