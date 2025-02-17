<?php

namespace App\Http\Controllers;
use App\Models\Movie;
use App\Models\Snack;
use App\Models\Ticket;
use App\Models\Client;
use App\Models\Seller;
use App\Models\User;
use Illuminate\Http\Request;

class SellerController extends Controller
{
    // Mostrar el dashboard del vendedor
    public function index()
    {
        //$sales = Sale::where('seller_id', auth()->user()->id)->get(); // Obtener ventas del vendedor autenticado
        $snacks = Snack::all(); // Obtener todos los snacks disponibles
        $movies = Movie::all(); // Obtener todas las películas disponibles

        return view('seller.dashboard', compact('snacks', 'movies'));
    }

     // Mostrar el formulario de creación de snacks
     public function createSnack()
     {
         return view('seller.create_snack'); // Ruta a tu vista create_snack.blade.php
     }
 
     // Manejar el envío del formulario para crear un nuevo snack
     public function storeSnack(Request $request)
     {
         // Validar los datos del formulario
         $request->validate([
             'name' => 'required|string|max:255',
             'type' => 'required|string|max:255',
             'price' => 'required|numeric|min:0',
             'quantity' => 'required|integer|min:0',
         ]);
 
         // Crear un nuevo snack
         Snack::create([
             'name' => $request->input('name'),
             'type' => $request->input('type'),
             'price' => $request->input('price'),
             'quantity' => $request->input('quantity'),
         ]);
 
         // Redirigir al usuario con un mensaje de éxito
         return redirect()->route('seller.snacks.create')->with('success', 'Snack creado con éxito.');
     }
    
         // Mostrar el formulario de creación de películas
    public function createMovie()
    {
        $startDate = now()->startOfDay(); // Ajusta según tus necesidades
        $endDate = now()->addDays(13)->endOfDay();
    
        $dates = collect();
        for ($date = $startDate; $date->lte($endDate); $date->addDay()) {
            $dates->push($date->copy());
        }
        return view('seller.create_movie', compact('dates')); // Ruta a tu vista create_movie.blade.php
    }

    // Manejar el envío del formulario para crear una nueva película
    public function storeMovie(Request $request)
    {
        // dd($request->all());
        // Validar los datos del formulario
        $request->validate([
            'title' => 'required|string|max:255',
            'director' => 'required|string|max:255',
            'release_date' => 'required|date',
            'genre' => 'required|string|max:255',
            'duration' => 'required|integer',
            'description' => 'nullable|string',
            'showtimes' => 'nullable|array',
            'showtimes.*' => 'nullable|string',
        ]);

        // Crear una nueva película
        Movie::create([
            'title' => $request->input('title'),
            'director' => $request->input('director'),
            'release_date' => $request->input('release_date'),
            'genre' => $request->input('genre'),
            'duration' => $request->input('duration'),
            'description' => $request->input('description'),
            'showtimes' => json_encode($request['showtimes']),
        ]);

        // Redirigir al usuario con un mensaje de éxito
        return redirect()->route('seller.movies.create')->with('success', 'Película creada con éxito.');
    }


        // Mostrar el formulario para vender boletos
        public function createTicket()
        {
            $movies = Movie::all(); // Obtén todas las películas disponibles7
            $snacks = Snack::all(); // Obtén todos los snacks disponibles
            return view('seller.sell_tickets', compact('movies', 'snacks')); // Ruta a tu vista sell_tickets.blade.php
        }


        public function storeTicket(Request $request)
        {
            // Validar los datos del formulario
            $validated = $request->validate([
                'movie_id' => 'required|exists:movies,id',
                'showdate' => 'required|date',
                'showtime' => 'required|string',
                'quantity' => 'required|integer|min:1',
                'seats' => 'required|array',
                'seats.*' => 'required|string',
                'snacks' => 'nullable|array',
                'snacks.*' => 'nullable|exists:snacks,id',
                'snack_quantities' => 'nullable|array',
                'snack_quantities.*' => 'nullable|integer|min:1',
            ]);
        
            // Combinar snacks y sus cantidades
            $snacks = $request->input('snacks', []);
            $quantities = $request->input('snack_quantities', []);
            $snacksData = [];
        
            foreach ($snacks as $index => $snack) {
                if (isset($quantities[$index])) {
                    $snacksData[] = [
                        'snack_id' => $snack,
                        'quantity' => $quantities[$index],
                    ];
                }
            }
        
            // Crear una nueva venta de boletos
            Ticket::create([
                'movie_id' => $validated['movie_id'],
                'showdate' => $validated['showdate'],
                'showtime' => $validated['showtime'],
                'quantity' => $validated['quantity'],
                'seats' => json_encode($validated['seats']),
                'snacks' => json_encode($snacksData), // Guardar snacks como JSON
            ]);
        
            // Redirigir al usuario con un mensaje de éxito
            return redirect()->route('seller.tickets.create')->with('success', 'Boletos vendidos con éxito.');
        }
        
        
// app/Http/Controllers/MovieController.php
public function getShowtimes($movieId)
{
    $movie = Movie::find($movieId);
    
    if (!$movie) {
        return response()->json(['error' => 'Película no encontrada'], 404);
    }

    // Asegúrate de que $movie->showtimes sea un array o convierte a uno
    $showtimes = json_decode($movie->showtimes, true);

    // Verifica que $showtimes sea un array
    if (!is_array($showtimes)) {
        $showtimes = [];
    }

    return response()->json(['showtimes' => $showtimes]);
}

public function showReports()
{
    // Obtener todos los clientes que tienen el rol de 'client'
    $clientes = User::where('rol', 'client')->get();

    // Obtener todas las ventas
    $ventas = Ticket::all();    // Obtener todas las ventas

    return view('seller.reports', compact('clientes', 'ventas'));
}

}
