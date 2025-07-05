class CategoryFormatter < RSpec::Core::Formatters::DocumentationFormatter
  RSpec::Core::Formatters.register self, :example_passed, :example_failed, :dump_summary

  def initialize(output)
    super
    @results = Hash.new { |h, k| h[k] = { pass: 0, fail: 0 } }
  end

  def example_passed(notification)
    category = notification.example.metadata[:spec_category]
    @results[category][:pass] += 1 if category
  end

  def example_failed(notification)
    category = notification.example.metadata[:spec_category]
    @results[category][:fail] += 1 if category
  end

  def dump_summary(summary)
    output.puts "\nカテゴリ別のテスト結果"
    output.puts "---------------------"
    @results.each do |category, counts|
      pass = counts[:pass]
      fail = counts[:fail]
      ratio = pass.to_f / (pass + fail) * 100
      output.puts "#{category} - #{ratio}% (#{pass}/#{pass + fail})"
    end
  end
end