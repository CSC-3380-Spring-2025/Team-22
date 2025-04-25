using Godot;
using System;

public partial class Move : CharacterBody2D
{
	[Export]
	public int Speed { get; set; } = 400;
	private AnimatedSprite2D animatedSprite;

	public void GetInput()
	{

		Vector2 inputDirection = Input.GetVector("left", "right", "up", "down");
		Velocity = inputDirection * Speed;
	}

	public override void _PhysicsProcess(double delta)
	{
		GetInput();
		MoveAndSlide();
	}
	
	public override void _Ready()
	{
		animatedSprite = GetNode<AnimatedSprite2D>("AnimatedSprite2D");
	}

	public override void _Process(double delta)
	{
		if (Input.IsActionPressed("right") && Input.IsActionPressed("left")) {
			animatedSprite.Stop();
		}
		if (Input.IsActionPressed("up") && Input.IsActionPressed("down")) {
			animatedSprite.Stop();
		}
		
		if (Input.IsActionPressed("right")) {
			animatedSprite.Play("Right");
		}
		else if (Input.IsActionPressed("left")) {
			animatedSprite.Play("Left");
		}
		else if (Input.IsActionPressed("up")) {
			animatedSprite.Play("Up");
		}
		else if (Input.IsActionPressed("down")) {
			animatedSprite.Play("Down");
		}
		else {
			animatedSprite.Stop();
		}
	}
}
