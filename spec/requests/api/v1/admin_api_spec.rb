require 'rails_helper'

describe 'as admin', type: :request do
  it 'renders json when visiting the tutorial api endpoint' do
    admin = create(:admin)
    video = create(:video)
    tutorial = create(:tutorial, videos: [video])
    tut_serial = {tutorial_sequencer: {_json: [video.id]}}
    allow_any_instance_of(Admin::Api::V1::TutorialSequencerController).
    to receive(:current_user).and_return(admin)

    put admin_api_v1_path(tutorial, tut_serial)

    expect(response).to be_successful
    json = JSON.parse(response.body)

    expect(json).to be_a(Hash)
    expect(json["id"]).to eq(tutorial.id)
    expect(json["title"]).to eq(tutorial.title)
  end

  it 'renders json when visiting the tutorial api endpoint' do
    video = create(:video)
    tutorial = create(:tutorial, videos: [video])
    tut_serial = {tutorial_sequencer: {_json: [video.id]}}



    expect {put admin_api_v1_path(tutorial, tut_serial)}.to(
      raise_error(ActionController::RoutingError)
    )
  end
end
