select FImportePedido('vinet');

select productId, productName, unitPrice, round(AplicarPVP(UnitPrice, 10), 2)
from products;