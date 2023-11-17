<?php

// database/factories/AdminFactory.php

namespace Database\Factories;

use App\Models\admin; // Make sure to import the Admin model
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;
use Faker\Generator as Faker;

class adminFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = admin::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'Name' => $this->faker->name,
            'Email' => $this->faker->unique()->safeEmail,
            'password' => bcrypt('password123'), // Use bcrypt to hash the password
            'phone_number' => $this->faker->phoneNumber,
            'Image_url' => $this->faker->imageUrl(),
            'created_at' => now(),
            'updated_at' => now(),
        ];
    }
}
