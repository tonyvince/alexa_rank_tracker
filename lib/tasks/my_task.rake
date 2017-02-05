namespace :recurring do
  desc "Get website rank everyday at 12:00 OM UTC"
  task init: :environment do
    #Delete any previously-scheduled recurring jobs
    Delayed::Job.where('(handler LIKE ?)', '--- !ruby/object:Recurring::%').destroy_all

    Recurring::MyTask.schedule!
  end
end