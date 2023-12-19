<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Carbon\Carbon;
use App\Models\broadcast_questions;


class QuizAvailabilityMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {

        // Retrieve all quizzes from the database
        $quizzes = broadcast_questions::all();

        $now = Carbon::now();

        // Check availability for each quiz
        foreach ($quizzes as $quiz) {
            $dateofLive = Carbon::parse($quiz->dateofLive);
            $start_time = Carbon::parse($quiz->start_time);
            $end_time = Carbon::parse($quiz->end_time);

            // If the current time is within the time range of any quiz, allow the request to proceed
            if ($now >= $start_time && $now <= $end_time) {
                return $next($request);
            }
        }

        // If no quiz is currently available, return a JSON response with a 403 Forbidden status
        // return response()->json(['error' => 'No quiz is available at the moment.'], 403);
        return response()->json([
            'error' => 'No quiz is available at the moment.',
            'DateOfLive' => $dateofLive,
        ], 403);
    }
}
