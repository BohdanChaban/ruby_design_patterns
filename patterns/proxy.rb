class TeamAccount
  attr_reader :balance

  def initialize(balance = 0)
    @balance = balance
  end

  def increase(amount)
    @balance += amount
  end

  def decrease(amount)
    @balance -= amount
  end
end

class VirtualAccountProxy
  def initialize(balance = 0)
    @balance = balance
  end

  def increase(amount)
    subject.increase(amount)
  end

  def decrease(amount)
    subject.decrease(amount)
  end

  def balance
    subject.balance
  end

  private

  def subject
    @subject ||= TeamAccount.new(@balance)
  end
end

class RemoteAccountProxy
  def initialize
    @base_uri = "localhost:3000/team_account"
  end

  def balance
    rest_service.get("/balance")
  end

  def increase(amount)
    rest_service.post("/increase", {amount: amount})
  end

  def decrease(amount)
    rest_service.delete("/decrease", {amount: amount})
  end

  private

  attr_reader :rest_service

  def rest_service
    @rest_client ||= RestClient.new(@base_uri, :json)
  end
end

class ProtectionAccountProxy
  attr_reader :user_credentials

  def initialize(user_credentials)
    @subject = TeamAccount.new
    @user_credentials = user_credentials
  end

  def balance
    check_permissions(:read)
    @subject.balance
  end

  def increase(amount)
    check_permissions(:write)
    @subject.increase(amount)
  end

  def decrease(amount)
    check_permissions(:write)
    @subject.decrease(amount)
  end

  private

  def check_permissions(permission_type)
    # CredentialValidator isn't implemented in this example
    unless CredentialValidator.validate(@user_credentials, permission_type)
      raise "Account #{@user_credentials} #{permission_type} action denied."
    end
  end
end
