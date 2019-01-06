class RxController < ApplicationController
  def regist
    @reserve = Reserve.create(name: "sometwo")
  end
end
