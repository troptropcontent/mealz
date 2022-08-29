class RecipeParamsHandler
  def initialize(course, recipe_params)
    @course = course
    @recipe_params = recipe_params
    @new_ingredients = []
  end

  def call
    return unless @course.save
    relevant_params.each do |recipe_param|
      ingredient = safely_find_or_create_ingredient(recipe_param[:ingredient])
      recipe = safely_create_or_update_recipe(ingredient, recipe_param[:quantity])
    end
  end

  private

  def safely_find_or_create_ingredient(ingredient_params)

    ingredient_params[:name] = ingredient_params[:name].strip.downcase
    sanitized_params = ingredient_params.compact_blank
    
    
    ingredient = Ingredient.create_with(sanitized_params)
                           .find_or_initialize_by(name: ingredient_params[:name])
    
    @new_ingredients << ingredient if ingredient.new_record?
    
    ingredient.save!
  
    ingredient
  end

  def safely_create_or_update_recipe(ingredient, quantity)
    recipe = @course.recipes.find_or_initialize_by(ingredient: ingredient)
    recipe.quantity = quantity

    recipe.save!

    recipe
  end

  def relevant_params
    @recipe_params.filter do |param|
      param[:quantity].present?
    end
  end
end
