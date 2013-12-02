class Fixnum
  def in_words
    # n / power of 10 = leftmost digit. n % power of 10 = remaining right digits.

    words = []

    case self
    when 0..19
      words.unshift(teen(self))
    when 20..99
      words.unshift(tens(self))
    when 100..999
      words.unshift(hundreds(self))
    when 1000..999_999
      words.unshift(thousands(self))
    when 10**6..999_999_999
      words.unshift(millions(self))
    when 10**9..999_999_999_999
      words.unshift(billions(self))
    when 10**12..999_999_999_999_999
      words.unshift(trillions(self))
    end

    words.join(' ')
  end

  def trillions(n)
    return billions(n) if n < 10**12

    if n % 10**(n.to_s.length - 1) != 0
      hundreds(n / 10**12) + ' trillion ' + billions(n % 10**12)
    else
      hundreds(n / 10**12) + ' trillion'
    end
  end

  def billions(n)
    return millions(n) if n < 10**9

    if n % 10**(n.to_s.length - 1) != 0
      hundreds(n / 10**9) + ' billion ' + millions(n % 10**9)
    else
      hundreds(n / 10**9) + ' billion'
    end
  end

  def millions(n)
    return thousands(n) if n < 10**6

    if n % 10**(n.to_s.length - 1) != 0
      hundreds(n / 10**6) + ' million ' + thousands(n % 10**6)
    else
      hundreds(n / 10**6) + ' million'
    end
  end

  def thousands(n)
    return hundreds(n) if n < 1000

    if n % 10**(n.to_s.length - 1) != 0
      hundreds(n / 1000) + ' thousand ' + hundreds(n % 1000)
    else
      hundreds(n / 1000) + ' thousand'
    end
  end

  def hundreds(n)
    return tens(n) if n < 100

    if n % 100 != 0   # if selfber is like 100, 200, 300, etc.
      teen(n / 100) + ' hundred ' + tens(n % 100)
    else
      teen(n / 100) + ' hundred'
    end
  end

  def tens(n)
    return teen(n) if n < 20

    d = %w[twenty thirty forty fifty sixty seventy eighty ninety]

    if n % 10 != 0    # if last digit isn't 0
      d[n / 10 - 2] + ' ' + teen(n % 10)
    else
      d[n / 10 - 2]
    end
  end

  def teen(n)
    d = %w[zero one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen]
    d[n]
  end
end