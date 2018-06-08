class PassedOrFailed
  def initialize(hash, threshold)
    @hash = hash.transform_values(&:to_i)
    @threshold = threshold.to_i
  end

  def perform
    { passed: group_students[:passed].to_h, failed: group_students[:failed].to_h }
  end

  private

  def group_students
    @group_students ||= @hash.group_by{ |_, v| v >= @threshold ? :passed  : :failed }
  end
end
