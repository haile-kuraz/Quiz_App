<?php

namespace App\Http\Controllers\Api;

use App\Models\score;

use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;

class Score_controller extends Controller
{
    public function index()
    {
        return "hellow it is  Score Api Bro";
    }
    public function Showall()
    {
        $this->updatePointToSum();
        $Score = score::all();


        if ($Score->count() > 0) {
            return response()->json([
                'status' => 200,
                'Scores' => $Score
            ], 200);
        } else {
            return response()->json([
                'status' => 404,
                'message' => 'There is no data recorded'
            ], 404);
        }
    }


    public function Addnew(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'student_id' => [
                'required',
                Rule::exists('students', 'id'),
            ],
            'broadcast_score' => 'required|numeric',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 422,
                'errors' => $validator->messages(),
            ], 422);
        } else {
            $existScore = Score::where('student_id', $request->student_id)->first();

            if ($existScore) {
                // Score with the given Student Id already exists
                return response()->json([
                    'status' => 409,
                    'message' => 'The Score already Exists',
                ], 409);
            } else {
                // Create a new score
                $score = Score::create([
                    'student_id' => $request->student_id,
                    'broadcast_score' => $request->broadcast_score,
                ]);

                // Update ranks based on descending order of broadcast_score
                $this->updateRanks();
                $this->updatePointToSum();
                if ($score) {
                    return response()->json([
                        'status' => 200,
                        'message' => 'Score has been created Successfully'
                    ], 200);
                } else {
                    return response()->json([
                        'status' => 500,
                        'message' => 'Server Error'
                    ], 500);
                }
            }
        }
    }

    private function updateRanks()
    {
        DB::statement('SET @rank = 0');

        DB::table('scores')
            ->orderBy('broadcast_score', 'desc')
            ->update(['rank' => DB::raw('( @rank := @rank + 1 )')]);
    }
    /*    private function updatePointToSum()
    {
        // Use raw SQL to calculate the average points for each student and cast to integer
        $sql = "
            UPDATE scores
            SET points = (
                SELECT CAST(SUM(point) AS SIGNED)
                FROM points
                WHERE points.student_id = scores.student_id
            )
        ";

        // Execute the raw SQL query
        DB::statement($sql);
    } */
    private function updatePointToSum()
    {
        // Get all distinct student IDs from the scores table
        $studentIds = Score::distinct('student_id')->pluck('student_id');

        foreach ($studentIds as $studentId) {
            // Calculate the Sum points for the current student
            $SumPoints = Score::find($studentId)->points()->sum('point');

            // Update the scores table for the current student
            Score::where('student_id', $studentId)->update(['points' => (int)$SumPoints]);
        }
    }

    public function Showone($student_id)
    {

        $Score = Score::where('student_id', $student_id)->select('broadcast_score', 'points', 'rank')->first();

        $this->updatePointToSum();
        if ($Score) {
            return response()->json([
                'status' => 200,
                'Score' =>  $Score
            ], 200);
        } else {
            return response()->json([
                'status' => 404,
                'message' => "No such Score is found"
            ], 404);
        }
    }

    // This is for Updting the Point value in the Score table
    public function UpdateScorePoint($student_id, Request $request)
    {
        $Score = Score::where('student_id', $student_id)->first();
        if ($Score) {
            $validator = Validator::make($request->all(), [
                'student_id' => [
                    'required',
                    Rule::exists('students', 'id'),
                ],
                'points' => 'required|numeric',
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'status' => 422,
                    'errors' => $validator->messages(),
                ], 422);
            } else {
                $Score->update([
                    'student_id' => $request->student_id,
                    'points' =>  $request->points,
                ]);
                // Update ranks based on descending order of broadcast_score
                $this->updateRanks();
                return response()->json([
                    'status' => 200,
                    'message' => 'points in the Score Table has been Updated Successfully'
                ], 200);
            }
        } else {
            return response()->json([
                'status' => 404,
                'message' =>  'No such Score point Found',
            ], 404);
        }
    }

    // This is for Updting the BroadCast value in the Score table
    public function UpdateBroadcastScore($student_id, Request $request)
    {



        $score = Score::where('student_id', $student_id)->first();

        if ($score) {
            $validator = Validator::make($request->all(), [
                'student_id' => [
                    'required',
                    Rule::exists('students', 'id'),
                ],
                'broadcast_score' => 'required|numeric',
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'status' => 422,
                    'errors' => $validator->messages(),
                ], 422);
            } else {
                $score->update([
                    'student_id' => $request->student_id,
                    'broadcast_score' => $request->broadcast_score,
                ]);
                $this->updateRanks();

                return response()->json([
                    'status' => 200,
                    'message' => 'BroadcastScore has been updated successfully',
                ], 200);
            }
        } else {
            return response()->json([
                'status' => 404,
                'message' => 'No such BroadcastScore found',
            ], 404);
        }
    }
    public function Delete($student_id)
    {

        $Score = Score::where('student_id', $student_id)->first();

        if ($Score) {
            $Score->delete();
            return response()->json([
                'status' => 200,
                "message" => "Score has been delated successfully"
            ], 200);
        } else {
            return response()->json([
                'status' => 404,
                "message" => "No such Score found"
            ], 404);
        }
    }
    public function deleteAll()
    {
        $Scores = score::all();

        if ($Scores->isEmpty()) {
            return response()->json([
                'status' => 404,
                'message' => 'No records found',
            ], 404);
        }

        foreach ($Scores as $Score) {
            $Score->delete();
        }
        // Reset auto-incremented ID for the table (MySQL example)
        DB::statement('ALTER TABLE scores AUTO_INCREMENT = 1');
        return response()->json([
            'status' => 200,
            'message' => 'All Scores has been deleted successfully',
        ], 200);
    }
}
