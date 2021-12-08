require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nameが空では登録できない' do
      @user = User.new(name: '', email: 'test@example', password: '000000', password_confirmation: '000000')
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end
    it 'emailが空では登録できない' do
      @user = User.new(name: 'test', email: '', password: '000000', password_confirmation: '000000')
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'メールアドレスが一意性であること。' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'メールアドレスは、@を含む必要があること。' do
      @user.email = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
  end
  it 'パスワードが必須であること。' do
    @user.password = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Password can't be blank")
  end
  it 'パスワードは、6文字以上での入力が必須であること' do
    @user.password = '00000'
    @user.password_confirmation = '00000'
    @user.valid?
    expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
  end
  it 'passwordは英語のみでは登録できないこと' do
    @user.password = 'aaaaaa'
    @user.password_confirmation = 'aaaaaa'
    @user.valid?
    expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
  end
  it 'passwordは数字のみでは登録できないこと' do
    @user.password = '000000'
    @user.password_confirmation = '000000'
    @user.valid?
    expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
  end
  it 'passwordは全角では登録できないこと' do
    @user.password = 'ああああああ'
    @user.password_confirmation = 'ああああああ'
    @user.valid?
    expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
  end
  it 'パスワードとパスワード（確認）は、値の一致が必須であること。' do
    @user.password_confirmation = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end
end
