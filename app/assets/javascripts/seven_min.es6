$(function() {
    const ExerciseInList = ({exercise, onRemoveExercise}) => (
        <li>
            <p>
                {exercise.position} - {exercise.exercise}
                <button onClick={() => onRemoveExercise(exercise)}
                    className="btn btn-default btn-xs">X</button>
            </p>
        </li>
    );

    class NewExerciseForm extends React.Component {
        constructor(props) {
            super(props);
            this.newExercise = {
                exercise: "",
                description: "",
                position: ""
            }

            this.submitNewExercise = this.submitNewExercise.bind(this);
        }

        submitNewExercise(evt) {
            evt.preventDefault();
            this.newExercise = {
                exercise: this.exercise.value,
                description: this.description.value,
                position: this.position.value
            };
            this.props.onNewExercise(this.newExercise);
        }

        render() {
            return (
                <form onSubmit={this.submitNewExercise}>
                    <fieldset>
                        <legend>Add New Exercise</legend>
                        <div className="form-group">
                            <label htmlFor="new-exercise-exercise">Exercise</label>
                            <input name="exercise" id="new-exercise-exercise" type="text"
                                ref={(input) => {this.exercise = input;}} className="form-control"/>
                        </div>
                        <div className="form-group">
                            <label htmlFor="new-exercise-description">Description</label>
                            <input name="description" id="new-exercise-description" type="text"
                                ref={(input) => {this.description = input;}} className="form-control"/>
                        </div>
                        <div className="form-group">
                            <label htmlFor="new-exercise-position">Position</label>
                            <input name="position" id="new-exercise-position" type="number"
                                ref={(input) => {this.position = input;}} className="form-control"/>
                        </div>
                        <input type="submit" value="Add"/>
                    </fieldset>
                </form>
            );
        }
    }

    class SevenMinApp extends React.Component {
        constructor(props) {
            super(props);
            this.state = {
                // Rendered in view as JSON
                exerciseList: exerciseList
            };
            this.handleNewExercise = this.handleNewExercise.bind(this);
            this.handleRemoveExercise = this.handleRemoveExercise.bind(this);
        }

        handleRemoveExercise(exercise) {
            var _this = this;
            $.ajax({
                url: "/admin/workouts/seven_mins/" + exercise.id,
                type: "DELETE",
                success: function(na) {
                    let exerciseList = _this.state.exerciseList;
                    var ids = exerciseList.map(function(ex) { return ex.id });
                    var index = ids.indexOf(exercise.id);
                    exerciseList.splice(index, 1);
                    _this.setState({exerciseList: exerciseList});
                }
            });
            console.log("removing", exercise);
        }

        handleNewExercise(exercise) {
            var _this = this;
            $.post("/admin/workouts/seven_mins", {
                seven_min: {
                    exercise: exercise.exercise,
                    description: exercise.description,
                    position: exercise.position
                }
            }).then(function(result) {
                _this.setState(prevState => ({
                    exerciseList: [...prevState.exerciseList, result]
                }));
            });
        }

        render() {
            return (<div>
                <div className="row">
                    <div className="col-md-8">
                        <h1>Start a 7-minute Workout</h1>
                        <a href="#" className="btn btn-primary">Start</a>
                    </div>
                    <div className="col-md-4">
                        <div className="panel panel-default">
                            <div className="panel-heading">
                                <h3 className="panel-title">Exercise List</h3>
                            </div>
                        </div>
                        <div className="panel-body">
                            <ul>
                                {this.state.exerciseList.map((exercise) => (
                                    <ExerciseInList key={exercise.id} exercise={exercise}
                                        onRemoveExercise={this.handleRemoveExercise} />
                                ))}
                            </ul>
                            <NewExerciseForm onNewExercise={this.handleNewExercise} />
                        </div>
                    </div>
                </div>
            </div>);
        }
    }

    ReactDOM.render(
        <SevenMinApp />,
        document.getElementById("seven-min-app"));
});
