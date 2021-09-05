require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do

      end
    end

    context '内容に問題がある場合' do
      it 'nicknameが空だと保存できないこと' do

      end
      it 'emailが空だと保存できないこと' do

      end
      it 'emailが重複していると保存できないこと' do

      end
      it 'emailに@が含まれていないと保存できないこと' do

      end
      it 'encrypted_passwordが空だと保存できないこと' do
        
      end
      it 'encrypted_passwordが5文字以下だと保存できないこと' do
      
      end
      it 'encrypted_passwordが英字だけだと保存できないこと' do

      end
      it 'encrypted_passwordが数字だけだと保存できないこと' do

      end
      it 'encrypted_passwordとpassword_confirmationが一致しなければ保存できないこと' do

      end
      it 'lastnameが空だと保存できないこと' do
      
      end
      it 'lastnameが全角日本語でないと保存できないこと' do
      
      end
      it 'firstnameが空だと保存できないこと' do
      
      end
      it 'firstnameが全角日本語でないと保存できないこと' do
      
      end
      it 'lastname_kanaが空だと保存できないこと' do
      
      end
      it 'lastname_kanaが全角カタカナでないと保存できないこと' do
      
      end
      it 'firstname_kanaが空だと保存できないこと' do
      
      end
      it 'firstname_kanaが全角カタカナでないと保存できないこと' do
      
      end
      it 'birthdayが空だと保存できないこと' do
      
      end

    end
  
  end
end
