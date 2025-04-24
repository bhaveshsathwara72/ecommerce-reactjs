<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    public function index()
    {
        return User::all();
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:8',
            'role' => 'sometimes|string'
        ]);

        $validated['password'] = Hash::make($validated['password']);

        return User::create($validated);
    }

    public function show(User $user)
    {
        return $user;
    }

    public function update(Request $request, User $user)
    {
        $validated = $request->validate([
            'name' => 'sometimes|string|max:255',
            'email' => 'sometimes|string|email|max:255|unique:users,email,'.$user->id,
            'password' => 'sometimes|string|min:8',
            'role' => 'sometimes|string'
        ]);

        if (isset($validated['password'])) {
            $validated['password'] = Hash::make($validated['password']);
        }

        $user->update($validated);

        return $user;
    }

    public function destroy(User $user)
    {
        $user->delete();
        return response()->noContent();
    }
}