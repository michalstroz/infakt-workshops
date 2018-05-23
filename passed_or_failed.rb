class PassedOrFailed
  def initialize(hash, threshold)
    @hash = hash.inject({}){ |h, (k, v)| h[k] = v.to_i; h}
    @threshold = threshold.to_i
  end

  def perform
    create_hash
  end

  private

  def group_studends
    @hash.group_by{ |k, v| v >= @threshold ? :passed  : :failed }
  end

  def create_hash
    group = group_studends
    { passed: group[:passed].to_h, failed: group[:failed].to_h }
  end
end
