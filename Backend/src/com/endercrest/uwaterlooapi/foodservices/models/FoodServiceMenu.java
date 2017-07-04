package com.endercrest.uwaterlooapi.foodservices.models;

import com.google.gson.annotations.SerializedName;

import java.util.List;

/**
 * Created by Thomas Cordua-von Specht on 11/25/2016.
 */
public class FoodServiceMenu {

    private FoodServiceDate data;
    private List<FoodServiceMenuOutlet> outlets;

    public FoodServiceDate getData() {
        return data;
    }

    public void setData(FoodServiceDate data) {
        this.data = data;
    }

    public List<FoodServiceMenuOutlet> getOutlets() {
        return outlets;
    }

    public void setOutlets(List<FoodServiceMenuOutlet> outlets) {
        this.outlets = outlets;
    }

    public class FoodServiceMenuOutlet {

        @SerializedName("outlet_name")
        private String outletName;
        @SerializedName("outlet_id")
        private String outletId;
        private FoodServiceOutletMenu menu;

        public String getOutletName() {
            return outletName;
        }

        public void setOutletName(String outletName) {
            this.outletName = outletName;
        }

        public String getOutletId() {
            return outletId;
        }

        public void setOutletId(String outletId) {
            this.outletId = outletId;
        }

        public FoodServiceOutletMenu getMenu() {
            return menu;
        }

        public void setMenu(FoodServiceOutletMenu menu) {
            this.menu = menu;
        }

        public class FoodServiceOutletMenu{

            private String date;
            private String day;
            private FoodServiceMeal meals;
            private String notes;

            public String getDate() {
                return date;
            }

            public void setDate(String date) {
                this.date = date;
            }

            public String getDay() {
                return day;
            }

            public void setDay(String day) {
                this.day = day;
            }

            public FoodServiceMeal getMeals() {
                return meals;
            }

            public void setMeals(FoodServiceMeal meals) {
                this.meals = meals;
            }

            public String getNotes() {
                return notes;
            }

            public void setNotes(String notes) {
                this.notes = notes;
            }

            public class FoodServiceMeal{

                private List<FoodServiceMenuItem> lunch;
                private List<FoodServiceMenuItem> dinner;

                public List<FoodServiceMenuItem> getLunch() {
                    return lunch;
                }

                public void setLunch(List<FoodServiceMenuItem> lunch) {
                    this.lunch = lunch;
                }

                public List<FoodServiceMenuItem> getDinner() {
                    return dinner;
                }

                public void setDinner(List<FoodServiceMenuItem> dinner) {
                    this.dinner = dinner;
                }

                public class FoodServiceMenuItem{

                    @SerializedName("product_name")
                    private String productName;
                    @SerializedName("diet_type")
                    private String dietType;
                    @SerializedName("product_id")
                    private String productId;

                    public String getProductName() {
                        return productName;
                    }

                    public void setProductName(String productName) {
                        this.productName = productName;
                    }

                    public String getDietType() {
                        return dietType;
                    }

                    public void setDietType(String dietType) {
                        this.dietType = dietType;
                    }

                    public String getProductId() {
                        return productId;
                    }

                    public void setProductId(String productId) {
                        this.productId = productId;
                    }
                }
            }
        }
    }

    public class FoodServiceDate{

        private int week;
        private int year;
        private String start;
        private String end;

        public int getWeek() {
            return week;
        }

        public void setWeek(int week) {
            this.week = week;
        }

        public int getYear() {
            return year;
        }

        public void setYear(int year) {
            this.year = year;
        }

        public String getStart() {
            return start;
        }

        public void setStart(String start) {
            this.start = start;
        }

        public String getEnd() {
            return end;
        }

        public void setEnd(String end) {
            this.end = end;
        }
    }
}
