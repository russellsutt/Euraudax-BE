class FollowsController < ApplicationController
    skip_before_action :authorized
end
