# frozen_string_literal: true
require 'rails_helper'

descrive 'モデルのテスト' do
  it '有効な投稿内容の場合は保存される' do
    expect (FactoryBot.build(:list)).to be_valid
  end
end