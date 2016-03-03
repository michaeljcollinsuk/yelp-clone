module WithUserAssociationExtension

  # def create_with_user()
  #
  # end

  # def create_with_user!()
  #
  # end

  def build_with_user(attributes = {}, user)
    attributes[:user] ||= user
    build(attributes)
  end
end
