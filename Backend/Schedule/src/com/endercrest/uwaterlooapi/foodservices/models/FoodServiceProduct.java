package com.endercrest.uwaterlooapi.foodservices.models;

import com.google.gson.annotations.SerializedName;

/**
 * Created by Thomas Cordua-von Specht on 12/1/2016.
 */
public class FoodServiceProduct {

    @SerializedName("product_id")
    private int productId;
    @SerializedName("product_name")
    private String productName;
    private String ingredients;
    @SerializedName("serving_size")
    private String servingSize;
    @SerializedName("serving_size_ml")
    private int servingSizeMl;
    @SerializedName("serving_size_g")
    private int servingSizeG;
    private int calories;
    @SerializedName("total_fat_g")
    private int totalFatG;
    @SerializedName("total_fat_percent")
    private int totalFatPercent;
    @SerializedName("fat_saturated_g")
    private int fatSaturatedG;
    @SerializedName("fat_saturated_percent")
    private int fatSaturatedPercent;
    @SerializedName("fat_trans_g")
    private int fatTransG;
    @SerializedName("fat_trans_percent")
    private int fatTransPercent;
    @SerializedName("cholesterol_mg")
    private int cholesterolMg;
    @SerializedName("sodium_mg")
    private int sodiumMg;
    @SerializedName("sodium_percent")
    private int sodiumPercent;
    @SerializedName("carbo_g")
    private int carboG;
    @SerializedName("carbo_percent")
    private int carboPercent;
    @SerializedName("carbo_fibre_g")
    private int carboFibreG;
    @SerializedName("carbo_fibre_percent")
    private int carboFibrePercent;
    @SerializedName("carbo_sugars_g")
    private int carboSugarsG;
    @SerializedName("protein_g")
    private int proteinG;
    @SerializedName("vitamin_a_percent")
    private int vitaminAPercent;
    @SerializedName("vitamin_c_percent")
    private int vitaminCPercent;
    @SerializedName("calcium_percent")
    private int calciumPercent;
    @SerializedName("iron_percent")
    private int ironPercent;
    @SerializedName("micro_nutrients")
    private String microNutrients;
    private String tips;
    @SerializedName("diet_id")
    private int dietId;
    @SerializedName("diet_type")
    private int dietType;

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getIngredients() {
        return ingredients;
    }

    public void setIngredients(String ingredients) {
        this.ingredients = ingredients;
    }

    public String getServingSize() {
        return servingSize;
    }

    public void setServingSize(String servingSize) {
        this.servingSize = servingSize;
    }

    public int getServingSizeMl() {
        return servingSizeMl;
    }

    public void setServingSizeMl(int servingSizeMl) {
        this.servingSizeMl = servingSizeMl;
    }

    public int getServingSizeG() {
        return servingSizeG;
    }

    public void setServingSizeG(int servingSizeG) {
        this.servingSizeG = servingSizeG;
    }

    public int getCalories() {
        return calories;
    }

    public void setCalories(int calories) {
        this.calories = calories;
    }

    public int getTotalFatG() {
        return totalFatG;
    }

    public void setTotalFatG(int totalFatG) {
        this.totalFatG = totalFatG;
    }

    public int getTotalFatPercent() {
        return totalFatPercent;
    }

    public void setTotalFatPercent(int totalFatPercent) {
        this.totalFatPercent = totalFatPercent;
    }

    public int getFatSaturatedG() {
        return fatSaturatedG;
    }

    public void setFatSaturatedG(int fatSaturatedG) {
        this.fatSaturatedG = fatSaturatedG;
    }

    public int getFatSaturatedPercent() {
        return fatSaturatedPercent;
    }

    public void setFatSaturatedPercent(int fatSaturatedPercent) {
        this.fatSaturatedPercent = fatSaturatedPercent;
    }

    public int getFatTransG() {
        return fatTransG;
    }

    public void setFatTransG(int fatTransG) {
        this.fatTransG = fatTransG;
    }

    public int getFatTransPercent() {
        return fatTransPercent;
    }

    public void setFatTransPercent(int fatTransPercent) {
        this.fatTransPercent = fatTransPercent;
    }

    public int getCholesterolMg() {
        return cholesterolMg;
    }

    public void setCholesterolMg(int cholesterolMg) {
        this.cholesterolMg = cholesterolMg;
    }

    public int getSodiumMg() {
        return sodiumMg;
    }

    public void setSodiumMg(int sodiumMg) {
        this.sodiumMg = sodiumMg;
    }

    public int getSodiumPercent() {
        return sodiumPercent;
    }

    public void setSodiumPercent(int sodiumPercent) {
        this.sodiumPercent = sodiumPercent;
    }

    public int getCarboG() {
        return carboG;
    }

    public void setCarboG(int carboG) {
        this.carboG = carboG;
    }

    public int getCarboPercent() {
        return carboPercent;
    }

    public void setCarboPercent(int carboPercent) {
        this.carboPercent = carboPercent;
    }

    public int getCarboFibreG() {
        return carboFibreG;
    }

    public void setCarboFibreG(int carboFibreG) {
        this.carboFibreG = carboFibreG;
    }

    public int getCarboFibrePercent() {
        return carboFibrePercent;
    }

    public void setCarboFibrePercent(int carboFibrePercent) {
        this.carboFibrePercent = carboFibrePercent;
    }

    public int getCarboSugarsG() {
        return carboSugarsG;
    }

    public void setCarboSugarsG(int carboSugarsG) {
        this.carboSugarsG = carboSugarsG;
    }

    public int getProteinG() {
        return proteinG;
    }

    public void setProteinG(int proteinG) {
        this.proteinG = proteinG;
    }

    public int getVitaminAPercent() {
        return vitaminAPercent;
    }

    public void setVitaminAPercent(int vitaminAPercent) {
        this.vitaminAPercent = vitaminAPercent;
    }

    public int getVitaminCPercent() {
        return vitaminCPercent;
    }

    public void setVitaminCPercent(int vitaminCPercent) {
        this.vitaminCPercent = vitaminCPercent;
    }

    public int getCalciumPercent() {
        return calciumPercent;
    }

    public void setCalciumPercent(int calciumPercent) {
        this.calciumPercent = calciumPercent;
    }

    public int getIronPercent() {
        return ironPercent;
    }

    public void setIronPercent(int ironPercent) {
        this.ironPercent = ironPercent;
    }

    public String getMicroNutrients() {
        return microNutrients;
    }

    public void setMicroNutrients(String microNutrients) {
        this.microNutrients = microNutrients;
    }

    public String getTips() {
        return tips;
    }

    public void setTips(String tips) {
        this.tips = tips;
    }

    public int getDietId() {
        return dietId;
    }

    public void setDietId(int dietId) {
        this.dietId = dietId;
    }

    public int getDietType() {
        return dietType;
    }

    public void setDietType(int dietType) {
        this.dietType = dietType;
    }
}
