require 'spec_helper'

describe "RootController" do
  before do
    get '/'
  end
  it "responds with a 200 status code" do
    expect(last_response).to be_ok
  end
  it "welcomes you to halloween, the greatest holiday" do
    expect(last_response.body).to include("<h1>Welcome to Halloween</h1>")
    expect(last_response.body).to include("<h2>The greatest holiday</h2>")
  end
  it "has link to kids/new" do
    expect(last_response.body).to include('<a href="/kids/new"')
    expect(last_response.body).to include("</a>")
  end
end
