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
                var _this = this;
                $.post("/admin/workouts/seven_mins", {
                    seven_min: {
                        exercise: _this.$data.exercise,
                        description: _this.$data.description,
                        position: _this.$data.position
                    }
                }).then(function(result) {
                    _this.$emit("add", result);
                    _this.$data.exercise = "";
                    _this.$data.description = "";
                    _this.$data.position = 0;
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
            remove: function(exercise) {
                var _this = this;
                $.ajax({
                    url: "/admin/workouts/seven_mins/" + exercise.id,
                    type: "DELETE",
                    success: function(na) {
                        var ids = _this.exerciseList.map(function(ex) { return ex.id });
                        var index = ids.indexOf(exercise.id);
                        _this.exerciseList.splice(index, 1);
                    }
                });
            },
            addToList(data) {
                this.exerciseList.push(data);
            }
        }
    });
});
