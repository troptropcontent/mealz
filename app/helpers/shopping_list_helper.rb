module ShoppingListHelper
    def quantity_with_unit(ingredient_with_quantity)
        unit = I18n.t("ingredient.unit.#{ingredient_with_quantity.unit}", count: ingredient_with_quantity.total_quantity)
        "#{ingredient_with_quantity.total_quantity.to_i} #{unit}"
    end
end
