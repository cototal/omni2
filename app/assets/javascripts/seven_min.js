$(function() {
    Vue.component("new-exercise", {
        template: "#new-exercise-template",
        data: function() {
            return {
                exercise: "",
                description: "",
                position: 0
            };
        },
        methods: {
            submit() {
                _this = this;
                $.post("/admin/workouts/seven_mins", {
                    seven_min: {
                        exercise: _this.$data.exercise,
                        description: _this.$data.description,
                        position: _this.$data.position
                    }
                }).then(function(result) {
                    _this.$emit("add", result);
                });
            }
        }
    });

    new Vue({
        name: "Exercise List",
        el: "#seven-min-list",
        template: "#list-template",
        data: function() {
            return {
                exerciseList: exerciseList
            };
        },
        computed: {
            sortedList() {
                return this.exerciseList.sort(function(alpha, beta) {
                    return alpha.position - beta.position;
                });
            }
        },
        methods: {
            addToList(data) {
                this.exerciseList.push(data);
            }
        }
    });
});
