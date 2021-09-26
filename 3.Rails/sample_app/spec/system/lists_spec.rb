# frozen_string_literal: true

require 'rails_helper'

describe '投稿のテスト' do
  let!(:list) {create(:list, title: 'hoge', body: 'body')}
  describe 'トップ画面のテスト' do
    before do
      visit top_path
    end
    context '表示の確認' do
      it 'トップ画面に「ここはTOPページです」が表示されているか'  do
        ecpect(page).to have_content 'ここはTOPページです'
      end
      it 'top_pathが"/top"であるか' do
        expect(current_path).eq ('/top')
      end
    end
    end
  end

  describe '投稿画面のテスト' do
    before do
      visit todolist_new_path
    end
    context '表示の確認' do
      it 'todolist_new_pathが/todolist/newであるか' do
        expext(current_path).to eq '/todolist/new'
      end
      it '投稿ボタンが表示されているか' do
        expect(page).to have_botton '投稿'
      end
      context '投稿処理のテスト'
        it '投稿後のリダイレクト先は正しいか'
        fill_in 'list[title]', with: Faker::Lorem.character(number:5)
        fill_in 'list[body]', with: Faker::Lorem.characters(number:20)
        click_button '投稿'
        expect(page).to have_current_pathto todolists_path(List.last)
      end

  end


  describe '一覧画面のテスト' do
    before do
      visit todolists_path
    end
    context '一覧画面の表示とリンクの確認' do
      it '一覧画面に投稿されたもの表示されているか' do
        expct(page).to have_content book.title
        expct(page).to have_content book.body
      end
    end
  end

  descrive '詳細画面のテスト' do
    before do
      visit todolist_path(list)
    end
    context '表示のテスト' do
      it '削除リンクが存在しているか' do
        expect(page).to have_link '削除'
      end
      it '編集リンクが存在しているか' do
        expect(page).to have_link '編集'
      end
    end
    context 'リンクの偏移先の確認' do
      it '編集の偏移先は編集画面か' do
        edit_link = find_all('a')[3]
        edit_link.click
        expect(current_path).to eq '/lists/' + list_id.to_s + '/edit'
      end
    end
    context 'list削除のテスト' do
      before do
          click_link '削除'
        end
      it 'listの削除' do
        # expect(Book.where(id: list.id).count).to eq 0
        expect{ list.destroy }.to cahge{List.count}.by(-1)
      end
    end
  end


  describe '編集画面のテスト' do
    before do
      visit edit_todolist_path(list)
    end

    context '表示の確認' do
      it '編集前のタイトルと本文がフォームにセットされている' do
        expect (page).to have_field 'list[title]', with: list.title
        expect (page).to have_field 'list[body]', with: list.body
      end
      it '保存ボタンが表示される' do
        expect(page).to have_button '保存'
      end
    end
    context '更新処理に関するテスト' do
      it '更新後のリダイレクト先は正しいか' do
        fill_in 'list[title]', with: Faker::Lorem.characters(number:5)
        fill_in 'list[body]', with: Faker::Lorem.characters(number:20)
        click_button '保存'
        expext(page).to have_current_path todolist_path(lists)
      end
    end
  end