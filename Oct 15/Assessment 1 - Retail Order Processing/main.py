import retail_utils
from retail_utils import calculate_order_total
import retail_utils as ru

amount = retail_utils.calculate_order_total(65000, 1)
print(amount)
print(retail_utils.calculate_discount(amount))
print(retail_utils.check_stock(12))
print(calculate_order_total(1500, 3))
print(ru.check_stock(0))
