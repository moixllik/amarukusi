"use strict";

const canvas = document.getElementById('canvas'),
    context = canvas.getContext('2d'),
    chakana = 321756043315785n,
    colorText = '#000',
    colorSun = '#00f',
    colorMoon = '#0f0',
    colorSelect = '#f00';

var box;
var match = {};

function draw() {
    resize();

    drawBoard();

    drawPlayers();
}

function resize() {
    const parent = document.body,
        width = parent.offsetWidth,
        height = parent.offsetHeight;

    box = Math.floor(Math.min(width, height) / 9);

    canvas.width = box * 9;
    canvas.height = box * 9;
}

function drawBoard() {
    context.clearRect(0, 0, canvas.width, canvas.height);

    for (let i = 0; i < 49; i++) {
        const x = Math.floor(i / 7) + 1, y = Math.floor(i % 7) + 1;

        if ((chakana & (1n << BigInt(i))) !== 0n) {
            context.fillStyle = '#000';
        } else {
            context.fillStyle = '#fff';
        }
        context.fillRect(x * box, y * box, box, box);
    }

    'ABCDEFG'.split('').forEach((x, i) => {
        drawText(i + 1, 0.4, 0.15, colorText, x);
        drawText(7 - i, 7.65, 0.15, colorText, x);

        drawText(0.4, i + 1, 0.15, colorText, i + 1);
        drawText(7.6, i + 1, 0.15, colorText, 7 - i);
    });
}

function drawPlayers() {
    drawPiece(0, 0, 0, colorText);
    drawPiece(8, 8, 0, colorText);

    drawText(6.5, 0, 0.5, colorText, '12:00');
    drawText(1, 0, 0.5, colorText, '07');
    drawText(0, 1, 0.5, colorText, '00');
    drawText(0, 2, 0.5, colorText, '00');

    drawText(1.5, 8, 0.5, colorText, '12:00');
    drawText(7, 8, 0.5, colorText, '07');
    drawText(8, 6, 0.5, colorText, '00');
    drawText(8, 7, 0.5, colorText, '00');
}

function drawText(x, y, size, fill, text) {
    context.fillStyle = fill;
    context.textAlign = 'center';
    context.textBaseline = 'middle';
    context.font = (size * box) + 'px monospace';
    context.fillText(text, (x + 0.5) * box, (y + 0.5) * box);
}

function drawPiece(x, y, position, fill) {
    const hole = [[0, -0.25], [-0.25, 0], [0, 0.25], [0.25, 0]][position];

    context.beginPath();
    context.fillStyle = fill;
    context.strokeStyle = '#000';
    context.arc(
        (x + 0.5) * box, (y + 0.5) * box,
        0.45 * box, 0, Math.PI * 2, false
    );
    context.arc(
        (x + 0.5 + hole[0]) * box, (y + 0.5 + hole[1]) * box,
        0.15 * box, 0, Math.PI * 2, false
    );
    context.stroke();
    context.fill('evenodd');
}

window.onresize = draw;
draw();
