require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  context 'ユーザー新規登録ができる場合' do
    it '全ての項目が正しく入力されていれば登録できる' do
      expect(@user).to be_valid
    end
  end

  context 'ユーザー新規登録ができない場合' do
    # 既存のテストコード
    it 'メールアドレスが必須であること' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'メールアドレスが一意性であること' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'メールアドレスは@を含む必要があること' do
      @user.email = 'testemail.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'パスワードが必須であること' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'パスワードは6文字以上での入力が必須であること' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'パスワードとパスワード（確認）は、値の一致が必須であること' do
      @user.password_confirmation = 'differentpassword'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    # 新規追加するテスト
    it '姓が必須であること' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it '名が必須であること' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it '姓（カナ）が必須であること' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it '名（カナ）が必須であること' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it '姓は全角文字でなければ登録できないこと' do
      @user.last_name = 'Yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name 姓は全角文字で入力してください')
    end

    it '名は全角文字でなければ登録できないこと' do
      @user.first_name = 'Taro'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name 名は全角文字で入力してください')
    end

    it '姓（カナ）は全角カタカナでなければ登録できないこと' do
      @user.last_name_kana = 'やまだ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana 姓のふりがなは全角カタカナで入力してください')
    end

    it '名（カナ）は全角カタカナでなければ登録できないこと' do
      @user.first_name_kana = 'たろう'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana 名のふりがなは全角カタカナで入力してください')
    end
  end
end
