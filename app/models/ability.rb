class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # ゲストユーザーの場合は新しい User オブジェクトを作成

    can :read, Photo # 誰でも写真を閲覧できる

    if user.persisted?
      can :create, Photo # ログインユーザーは写真を投稿できる
      can :destroy, Photo, user_id: user.id # ログインユーザーは自分の写真を削除できる
    end
  end
end