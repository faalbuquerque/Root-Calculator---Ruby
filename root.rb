def power num, pow=2
 	num ** pow
end

def less_than_root num
 	for i in (1..num).to_a.reverse
 		pow_num = power(i)
 		return i if pow_num <= num
 	end
end

def sub_root (sub_from, num)
 	sub_from - num
end
 
def double(num)
 	2 * num
end

def num_without_comma(num)
	num.split('.').join("").to_i
end

def trans_without_comma(num)
	result = num.to_s.split('.').join("").to_f.round 0
end

def result_partial_dec(partial_result, partial_root)
	calc_result = trans_without_comma(partial_result)
	calc_result = calc_result * 10

	for i in (0..9).to_a.reverse
		sum_i = calc_result + i
		mult_sum_i = sum_i * i

		return mult_sum_i if mult_sum_i <= partial_root
	end
end

def result_partial_dec_index(partial_result, partial_root)
	calc_result = trans_without_comma(partial_result)
	calc_result = calc_result * 10

	for i in (0..9).to_a.reverse
		sum_i = calc_result + i
		mult_sum_i = sum_i * i

		return i if mult_sum_i <= partial_root
	end
end

def add_two_zeros(num)
	num.to_i * 100
end

def update_result(result, unit_to_result)
	return [result, unit_to_result].join("") if result.include?('.')
	[result,'.', unit_to_result].join("")
end

# executing calc 
puts "Calculo de raiz quadrada"

puts "Digite um numero para saber a raiz quadrada"
input_root = gets.chomp.to_f

puts "Digite com quantas casas depois da virgula quer ver o resultado"
input_precision = gets.chomp.to_i

result = less_than_root(input_root).to_i
partial_result = power(result)
partial_sub_root = sub_root(input_root, partial_result)

partial_result = double(result)
partial_result = result_partial_dec(partial_result, partial_sub_root)
partial_sub_root = sub_root(partial_sub_root, partial_result)

result = result.to_s

for i in 1..input_precision do
	partial_sub_root = add_two_zeros(partial_sub_root)	 
  partial_result = double(num_without_comma(result))
	unit_to_result = result_partial_dec_index(partial_result, partial_sub_root)
	partial_result = result_partial_dec(partial_result, partial_sub_root)
	result = update_result(result, unit_to_result)
	partial_sub_root = sub_root(partial_sub_root, partial_result)
end

puts "Resultado da raiz de #{input_root} com #{input_precision} casa depois da virgula = #{result}"
