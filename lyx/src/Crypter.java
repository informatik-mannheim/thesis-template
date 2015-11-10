package de.smits_net.tpe.ue3.crypto;

/**
 * Grundlegendes Interface, um Verschlüsselung durchzuführen. Mit
 * Hilfe dieses Interfaces kann man Nachrichten verschlüsseln 
 * (über die {@link #verschluesseln(Key, String)} Methode) und 
 * wieder entschlüsseln (über die {@link #entschluesseln(Key,
 * String)} Methode).
 * @author Thomas Smits
 */
public interface Crypter {

    /**
     * Verschlüsselt den gegebenen Text mit dem angegebenen Schlüssel.
     *
     * @param key Schlüssel, der verwendet werden soll.
     * @param message Nachricht, die Verschlüsselt werden soll.
     *
     * @return verschlüsselter Text.
     * @throws CrypterException Probleme mit der
     *             Verschlüsselung aufgetreten.
     */
    public String verschluesseln(Key key, String message) throws CrypterException;
}
