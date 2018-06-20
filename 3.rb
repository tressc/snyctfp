def change_possibilities(amount, denoms)
  if amount == 0
    return 1
  end

  if amount < 0 || denoms.empty?
    return 0
  end

  change_possibilities(amount - denoms[-1], denoms) + change_possibilities(amount, denoms[0...-1])
end
